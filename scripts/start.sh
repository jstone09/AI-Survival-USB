#!/bin/bash
# ============================================================
#   AI SURVIVAL USB - Launch Script (Mac/Linux)
#   The Wired Watchman - thewiredwatchman.com
# ============================================================

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
export OLLAMA_MODELS="$SCRIPT_DIR/ollama/models"
export OLLAMA_PORT="${OLLAMA_PORT:-11434}"
export OLLAMA_HOST="127.0.0.1:${OLLAMA_PORT}"

echo ""
echo "  ============================================================"
echo "  |                                                          |"
echo "  |         AI SURVIVAL USB - Pocket Professor v1.0          |"
echo "  |                                                          |"
echo "  |    122 Million Books of Knowledge. No Internet Needed.   |"
echo "  |                                                          |"
echo "  |         The Wired Watchman - thewiredwatchman.com        |"
echo "  |                                                          |"
echo "  ============================================================"
echo ""
echo "  [INFO] Drive: $SCRIPT_DIR"
echo "  [INFO] Models: $OLLAMA_MODELS"
echo ""

# Check if ollama is installed on the system
if ! command -v ollama &> /dev/null; then
    echo "  [ERROR] Ollama is not installed on this system."
    echo "  Install it first:"
    echo "    Mac:   brew install ollama"
    echo "    Linux: curl -fsSL https://ollama.com/install.sh | sh"
    echo ""
    exit 1
fi

# Check for model files
if [ ! -d "$OLLAMA_MODELS" ]; then
    echo "  [WARNING] No models folder found."
    echo "  You may need to pull the model first:"
    echo "    export OLLAMA_MODELS=\"$OLLAMA_MODELS\""
    echo "    ollama pull dolphin-llama3"
    echo ""
fi

# Start server
echo "  [1/3] Starting Ollama server..."
ollama serve &
SERVER_PID=$!

# Wait for server
echo "  [2/3] Waiting for server..."
for i in $(seq 1 60); do
    if curl -s http://localhost:${OLLAMA_PORT}/api/version > /dev/null 2>&1; then
        break
    fi
    sleep 2
    echo "  Loading... [$i/60]"
done

echo "  [3/3] Server is READY!"
echo ""
echo "  ============================================================"
echo ""
echo "  Type any question. Type /bye to exit."
echo ""
echo "  ============================================================"
echo ""

# Run the model
ollama run dolphin-llama3

# Cleanup
echo ""
echo "  Shutting down server..."
kill $SERVER_PID 2>/dev/null
echo "  Done. Safe to eject your USB drive."
