#!/bin/bash
# ======================================================
#  Batch PDF Builder — The C++ Master Companion
#  Author: ZephyrAmmor (Amor)
#  Purpose: Converts all .md files in current directory
#           to PDFs using your preferred Pandoc settings.
# ======================================================

# Exit immediately if any command fails
set -e

# Font setup — change if you want to test other fonts
MAIN_FONT="Literata"
MONO_FONT="JetBrains Mono"

# Pandoc options
PANDOC_OPTS=(
  --pdf-engine=xelatex
  -V mainfont="$MAIN_FONT"
  -V monofont="$MONO_FONT"
  -V fontsize=10pt
  -V geometry:"a4paper,margin=1.5cm"
  -V colorlinks=true
  -V linkcolor=RoyalBlue
  -V urlcolor=blue
  -V toccolor=gray
  --highlight-style=pygments
  --toc
  --toc-depth=3
  --metadata title="The C++ Master Companion — Syntax, Insight & Practice"
  --metadata author="ZephyrAmmor"
  --metadata date="$(date +'%B %Y')"
  --pdf-engine-opt=-shell-escape
)

echo "🔧 Building PDFs from all .md files in $(pwd)..."
echo

for md in *.md; do
  # Skip if no Markdown files exist
  [ -e "$md" ] || { echo "❌ No .md files found."; exit 1; }

  # Strip .md extension and prepend a cleaner prefix
  base="${md%.md}"
  output="${base}.pdf"

  echo "📝 Processing: $md"
  pandoc "$md" -o "$output" "${PANDOC_OPTS[@]}"
  echo "✅ Created: $output"
  echo
done

echo "🎉 All PDFs generated successfully!"
