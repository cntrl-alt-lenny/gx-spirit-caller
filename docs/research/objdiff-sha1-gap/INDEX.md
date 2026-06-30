# objdiff-sha1 gap research index

## Files

| File | Coverage |
|------|------------|
| gap-taxonomy.md | 5 failure modes A-E; compare pipeline; sha1-clean recipe |

## Key finding

verify.py wildcards every pool word whose orig gap.o has R_ARM_ABS32 reloc. Since dsd delink emits relocs for ALL pool words, pool VALUES are never checked. Modes A/B explain ~80% of objdiff-100/sha1-fail. Fix: run ninja report between verify.py and ninja sha1.
