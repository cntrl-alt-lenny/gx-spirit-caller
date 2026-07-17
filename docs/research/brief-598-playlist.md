# Playlist 598: corpus fix + retrieval eval + harvest

All work was WINE-FREE. No ninja sha1, ninja rom, Wine, or batch_carve was
run. Native ninja delink was used to generate the objdump inputs.

## Brief 598a: corpus fix

The exporter now keeps local labels inside a function's objdump block and
stops only at the next non-local symbol. It also handles ARM/Thumb density and
literal-pool remainders.

```text
density assertion passed: 3521 rows
density assertion passed: 2790 rows
density assertion passed: 2790 rows
wrote tools/corpus/matched-pairs-eur.jsonl (3521 rows)
wrote tools/corpus/matched-pairs-usa.jsonl (2790 rows)
wrote tools/corpus/matched-pairs-jpn.jsonl (2790 rows)
```

Corrected target row: func_02037dc0, size 548, mnemonic count 135, beginning
`push sub ldr mov mov cmp addls b b b b b b b` and ending
`cmp moveq popeq mov mov bl mov pop`. The exact JSONL row is committed in the
EUR corpus.

## Brief 598b: retrieval evaluation

BM25 is implemented in pure Python with no external dependencies. Prominent
metrics:

```text
SELF-RETRIEVAL: 3521/3521 (100.00%)
TWIN-HIT-RATE: 0/32 (0.00%)
```

The fixture and harness tests pass.

## Brief 598c: decomp.me harvest

Request:

```text
https://decomp.me/api/scratch?compiler=mwcc_30_131
```

The raw response was HTTP 403 Cloudflare challenge HTML. No scraper or JSONL
harvest was attempted. First raw response lines:

```text
<!DOCTYPE html><html lang="en-US"><head><title>Just a moment...</title><meta http-equiv="Content-Type" content="text/html; charset=UTF-8"><meta http-equiv="X-UA-Compatible" content="IE=Edge"><meta name="robots" content="noindex,nofollow"><meta name="viewport" content="width=device-width, initial-scale=1"><meta http-equiv="content-security-policy" content="default-src &#39;none&#39;; script-src &#39;nonce-JoLXNZFxom2aHrz0VM5kae&#39; &#39;unsafe-eval&#39; https://challenges.cloudflare.com; script-src-attr &#39;none&#39;; style-src &#39;unsafe-inline&#39;; img-src &#39;self&#39; https://challenges.cloudflare.com; connect-src &#39;self&#39; https://challenges.cloudflare.com; frame-src https://challenges.cloudflare.com blob:; child-src https://challenges.cloudflare.com blob:; worker-src blob:; form-action http: https:; base-uri http: https:
```

## Verification

```text
2654 passed, 3 skipped, 13 subtests passed in 10.42s
```
