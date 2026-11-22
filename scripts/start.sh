#!/bin/bash
# ============================================================
#   AI SURVIVAL USB - Launch Script (Mac/Linux)
#   The Wired Watchman - thewiredwatchman.com
# ============================================================

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
export OLLAMA_MODELS="$SCRIPT_DIR/ollama/models"
export OLLAMA_PORT="${OLLAMA_PORT:-11434}"
export OLLAMA_HOST="${OLLAMA_HOST:-localhost}"
# Derive effective bind address (host:port) and base URL for readiness checks
INPUT_HOST="${OLLAMA_HOST}"
SCHEME=""
if [[ "$INPUT_HOST" =~ ^https?:// ]]; then
  if [[ "$INPUT_HOST" == https://* ]]; then
    SCHEME="https"
  else
    SCHEME="http"
  fi
  TRIMMED="${INPUT_HOST%/}"
  HOSTSPEC="${TRIMMED#http://}"
  HOSTSPEC="${HOSTSPEC#https://}"
  HOSTSPEC="${HOSTSPEC%%/*}"
else
  HOSTSPEC="$INPUT_HOST"
  SCHEME=""
fi
# Ensure hostspec contains an explicit port; bracket IPv6 if needed
if [[ "$HOSTSPEC" =~ ^\[.*\]:[0-9]+$ || "$HOSTSPEC" =~ :[0-9]+$ ]]; then
  :
else
  if [[ "$HOSTSPEC" == *:* && "$HOSTSPEC" != \[*\] ]]; then
    HOSTSPEC="[$HOSTSPEC]"
  fi
  HOSTSPEC="${HOSTSPEC}:${OLLAMA_PORT}"
fi
# Export effective host:port so both server and client use the same address
export OLLAMA_HOST="$HOSTSPEC"
# Build base URL preserving scheme if provided; otherwise default to http
if [[ -n "$SCHEME" ]]; then
  BASE_URL="${SCHEME}://${HOSTSPEC}"
else
  BASE_URL="http://${HOSTSPEC}"
fi


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
SERVER_URL="${BASE_URL}/api/version"
for ((i=1; i<=60; i++)); do
    if curl -s "$SERVER_URL" > /dev/null 2>&1; then
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
