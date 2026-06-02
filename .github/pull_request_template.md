<!--
Thanks for contributing!

Pick the section that fits and delete the others. If your PR doesn't fit
any of these (e.g. wiki, CI, docs), just describe what changed and why.
-->

## What changed

<!-- One or two sentences. -->

## Type of change

<!-- Check one. -->

- [ ] Function match (one or more functions now byte-identical)
- [ ] Symbol rename (`func_<addr>` → real name)
- [ ] Tooling / build (changes under `tools/`, `configure.py`, ninja rules)
- [ ] Headers / types (changes under `include/` or `libs/<lib>/include/`)
- [ ] Bootstrapping (region init, overlay layout, dsd config)
- [ ] Wiki / docs (changes under `wiki/`, `docs/`, `README.md`, `CLAUDE.md`)
- [ ] Other: ___

---

### For function matches

**Function(s) matched:**

| Address      | Module       | New name                  |
|--------------|--------------|---------------------------|
| `0x02xxxxxx` | `ov005`      | `Module_FunctionName`     |

**objdiff before / after** (paste the relevant diff section, or a screenshot):

```
<diff here>
```

**Region tested:** `eur` / `usa` / `jpn`

**Symbol renamed in `config/<ver>/**/symbols.txt`:** yes / no

---

### Pre-merge checklist

- [ ] `ninja` rebuilds cleanly
- [ ] `ninja objdiff` shows the function(s) matched
- [ ] `ninja sha1` passes (the project gate — byte-identical ROM, all 3 regions) and `dsd check modules` is green. (`dsd check symbols` is **informational only** — it has known pre-existing noise on unmatched gap data; see [`docs/research/ov004-check-symbols-diagnosis.md`](../docs/research/ov004-check-symbols-diagnosis.md).)
- [ ] Symbol renamed in `symbols.txt` if a function newly matched
- [ ] `assets/progress-heatmap.svg` regenerated and committed if matched % changed
- [ ] No comments explaining what well-named identifiers already convey
- [ ] No stray `*.nds`, `extract/`, or `build/` artifacts staged

---

### Notes for reviewers

<!-- Anything non-obvious: workarounds, why a particular cast, related upstream issues, etc. -->
