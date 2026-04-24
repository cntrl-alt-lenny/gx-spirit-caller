---
description: Run tools/find_cascades.py to predict tier-promotion cascades from renames. With no args, prints the top-20 highest-cascade placeholders; with `<module> <addr>`, prints the cascade for that specific symbol.
argument-hint: [<module> <addr>] [--top N]
allowed-tools: Bash, Read
---

Run `tools/find_cascades.py` with the user's arguments.

Parse `$ARGUMENTS`:

- **No args** — ranked mode. Shows top-N placeholder symbols by cascade weight (the count of `hard → medium` promotions their rename would trigger). Default N=20; pass `--top N` to change it.
- **`<module> <addr>`** — single-symbol mode. Predicts the cascade for naming exactly that placeholder.

Invoke the tool like:

```bash
# Ranked (no args)
python tools/find_cascades.py --version eur --top 20

# Single-symbol
python tools/find_cascades.py --version eur <module> <addr>
```

Then summarise for the user:

### Ranked mode

- Headline: `Found N cascade-producing targets.`
- Show the top-5 as a markdown table: rank / target / size / cascade-weight / caller-module-spread (if known)
- Highlight the top-1 and explain why it's a good pick (smallest size wins ties; high caller-module spread suggests SDK-fundamental).
- If any entries in the top-10 look like they've already been consumed by recent PRs, flag them. The PR history matters here — recently-merged decomp waves remove placeholders from the list.
- Offer the follow-up: "Pair the top pick with `/scratch <module> <addr>` for a drafting bundle, or `/suggest` if you want NitroSDK name candidates."

### Single-symbol mode

- If cascade > 0: headline with the number + list the first 5 promoted callers (module | addr).
- If cascade = 0: explain why (either no size-≤0x80 callers, or each caller has another placeholder callee blocking). Offer ranked mode as the alternative.

Do NOT dump the full `cascades.md` into the terminal — it's 600+ lines. Summarise + offer to show.

Remember: the cascade rule is `analyze_symbols.classify`'s `medium` gate (size ≤ 0x80 AND all direct callees named). Renaming the last placeholder callee flips the caller `hard → medium`. #132's PR body has the full model if the user asks for a primer.

Arguments: $ARGUMENTS
