#!/bin/bash

# Chapters list
chapters=(
"Living World"
"Plant Kingdom"
"Vegetative Morphology"
"Reproductive Morphology"
"Taxonomy and Systematic Botany"
"Cell: The Unit of Life"
"Cell Cycle"
"Biomolecules"
"Tissue and Tissue System"
"Secondary Growth"
"Transport in Plants"
"Mineral Nutrition"
"Photosynthesis"
"Respiration"
"Plant Growth and Development"
)

# Function to convert title → folder-name (lowercase, hyphen)
slugify () {
    echo "$1" | tr '[:upper:]' '[:lower:]' | sed 's/[^a-z0-9]/-/g' | sed 's/-\+/-/g' | sed 's/^-//' | sed 's/-$//'
}

# Loop through chapters
for i in "${!chapters[@]}"; do
    title="${chapters[$i]}"
    weight=$((i+1))
    folder=$(slugify "$title")

    echo "Processing: $title -> $folder"

    # Paths
    en_path="content.en/docs/$folder"
    ta_path="content.ta/docs/$folder"
    q_path="questions/$folder"

    # Create directories
    mkdir -p "$en_path"
    mkdir -p "$ta_path"
    mkdir -p "$q_path"

    # Create or overwrite EN _index.md
    cat > "$en_path/_index.md" <<EOL
---
title: '$title'
categories:
    - $folder
weight: $weight
---

$title
EOL

    # Create or overwrite TA _index.md
    cat > "$ta_path/_index.md" <<EOL
---
title: '$title'
categories:
    - $folder
weight: $weight
---

$title tamil
EOL

done

echo "✅ All chapters processed successfully!"