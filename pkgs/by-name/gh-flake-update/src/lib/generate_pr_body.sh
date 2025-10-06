# shellcheck shell=bash

generate_pr_body() {
  local flake_update_output=$1
  local -n all_attrs_ref=$2
  local -n build_failures_ref=$3
  local attr_reports=""

  for attr in "${all_attrs_ref[@]}"; do
    local slug
    slug=$(attr_to_slug "$attr")
    local current_build_path="$TMP_DIR/$slug.current"
    local next_build_path="$TMP_DIR/$slug.next"

    if [[ -v "build_failures_ref[$attr]" ]]; then
      attr_reports+=$(
        cat <<-EOF
<details>
<summary>Attribute: <code>${attr}</code> (Build Failed)</summary>

\`\`\`console
${build_failures_ref[$attr]}
\`\`\`

</details>
EOF
      )
    elif [ ! -L "$current_build_path" ]; then
      attr_reports+=$(
        cat <<-EOF
<details>
<summary>Attribute: <code>${attr}</code> (Initial Build Failed)</summary>

This attribute was already broken before the update and was skipped.
</details>
EOF
      )
    elif [ ! -L "$next_build_path" ]; then
      attr_reports+=$(
        cat <<-EOF
<details>
<summary>Attribute: <code>${attr}</code> (Update Build Failed)</summary>

The build for this attribute failed after the flake update.
</details>
EOF
      )
    else
      attr_reports+=$(
        cat <<-EOF
<details>
<summary>Attribute: <code>${attr}</code> (Diff)</summary>

\`\`\`console
$(dix "$current_build_path" "$next_build_path" || echo "dix command failed for $attr")
\`\`\`

</details>
EOF
      )
    fi
  done

  # Final PR body content
  cat <<-EOF
This PR was generated automatically to update the flake inputs.

<details>
<summary>Flake update summary (from commit message)</summary>

\`\`\`console
${flake_update_output}
\`\`\`

</details>

${attr_reports}
EOF
}
