#!/bin/bash
# ============================================================
#  Dhwani RIS RFP Scout - One-time Setup Script
#  Run this once on your Mac/Linux machine
# ============================================================

echo "=========================================="
echo "  Dhwani RIS RFP Scout - Setup"
echo "=========================================="

# Check Python
if ! command -v python3 &>/dev/null; then
    echo "ERROR: Python 3 is not installed."
    echo "Please install from: https://python.org/downloads"
    exit 1
fi

echo "✓ Python found: $(python3 --version)"

# Install packages
echo ""
echo "Installing required packages..."
pip3 install -r requirements.txt

echo ""
echo "=========================================="
echo "  Setup complete!"
echo ""
echo "  NEXT STEPS:"
echo "  1. Edit config.yaml — add your API key and email"
echo "  2. Run a test:  python3 rfp_agent.py --test"
echo "  3. Full run:    python3 rfp_agent.py"
echo ""
echo "  Proposals and digest saved in: ./rfp_output/YYYY-MM-DD/"
echo "=========================================="
