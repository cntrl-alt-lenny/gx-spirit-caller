# objdiff-sha1 gap — research index

## Files

| File | What it covers |
|------|----------------|
| gap-taxonomy.md | 5 failure modes A-E; verify.py/ninja-report/sha1 comparison pipeline; sha1-clean recipe |

## Key finding

verify.py wildcards every pool word whose orig gap.o slot has an R_ARM_ABS32 reloc.
Since dsd delink emits relocs for ALL pool words, pool word VALUES are never checked by verify.py.
Modes A (wrong pool value) and B (wrong callee) are the primary mechanism behind the ~80% objdiff-100%/sha1-fail rate.
Fix: add `ninja report` after instruction bytes look right, before running `ninja sha1`.
