---
description: Run tools/scratch_bundle.py on a decomp target to get a one-shot context bundle (callers + callees + adjacent siblings + NitroSDK hints). Optionally wrap as an LLM drafting prompt.
argument-hint: <module> <addr> [--prompt]
allowed-tools: Bash, Read
---

Run `tools/scratch_bundle.py` on the decomp target specified by the user.

Parse `$ARGUMENTS` as either:

- `<module> <addr>` — produce a Markdown bundle (default mode). Example: `main 0x02093820`.
- `<module> <addr> --prompt` — wrap the bundle with an LLM drafting header/footer so the user can paste it into their LLM of choice.

The first argument is the module (`main`, `itcm`, `dtcm`, or `ov000` … `ov023`). The second is the hex address (with or without leading `0x`). Treat any remaining args as forwarded flags.

Invoke the tool like:

```bash
python tools/scratch_bundle.py --version eur <module> <addr> [flags]
```

Then:

1. Summarise the target in one line for the user (name, size, tier, caller count).
2. Call out the most useful sections of the bundle:
   - If `NitroSDK context` is present, highlight the suggested `#include` header.
   - If adjacent siblings are listed, name the top-1 by distance and describe its shape in one sentence if obvious.
   - If the target is a leaf with only caller signal, say so — the decomper will rely on the caller-module-spread as the role hint.
3. Offer the next concrete step. Typical options:
   - "Draft C from this bundle" (paste to LLM / write yourself).
   - "Pair with `/cascade $1 $2`" if the target is a placeholder that might unlock tier promotions.
   - "Grep NitroSDK for functions calling <specific callee>" if the callee is a named BIOS thunk.

Do NOT ship the bundle to the user's terminal unless they asked for it (truncate to the top sections or summarise). The Markdown file is long — a summary + offer-to-show is usually more useful.

If the target isn't found, surface the error, then suggest `python tools/next_targets.py --version eur --no-outputs --top 20` to find a valid candidate.

Arguments: $ARGUMENTS
