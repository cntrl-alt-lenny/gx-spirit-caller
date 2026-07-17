# Brief 595: naming + corpus campaign

## Phase 0

BASE-OK. Object dump preflight: /opt/homebrew/bin/arm-none-eabi-objdump.

## Phase 1: naming coverage

The generated EUR table is in naming-census.md. Canary:

```text
| EUR | main | 4138 | 4090 | 48 |
```

The 48 real-named functions satisfy the canary.

EUR table:

```text
| EUR | dtcm | 0 | 0 | 0 |
| EUR | itcm | 14 | 14 | 0 |
| EUR | main | 4138 | 4090 | 48 |
| EUR | ov000 | 152 | 152 | 0 |
| EUR | ov001 | 6 | 6 | 0 |
| EUR | ov002 | 3777 | 3777 | 0 |
| EUR | ov003 | 35 | 34 | 1 |
| EUR | ov004 | 310 | 310 | 0 |
| EUR | ov005 | 90 | 90 | 0 |
| EUR | ov006 | 406 | 405 | 1 |
| EUR | ov007 | 34 | 34 | 0 |
| EUR | ov008 | 91 | 90 | 1 |
| EUR | ov009 | 38 | 38 | 0 |
| EUR | ov010 | 107 | 107 | 0 |
| EUR | ov011 | 194 | 193 | 1 |
| EUR | ov012 | 24 | 23 | 1 |
| EUR | ov013 | 16 | 11 | 5 |
| EUR | ov014 | 36 | 33 | 3 |
| EUR | ov015 | 74 | 68 | 6 |
| EUR | ov016 | 83 | 83 | 0 |
| EUR | ov017 | 59 | 59 | 0 |
| EUR | ov018 | 29 | 29 | 0 |
| EUR | ov019 | 47 | 47 | 0 |
| EUR | ov020 | 49 | 49 | 0 |
| EUR | ov021 | 40 | 38 | 2 |
| EUR | ov022 | 15 | 15 | 0 |
| EUR | ov023 | 3 | 3 | 0 |
```

## Phase 2: matched-pair corpus

Exported 3,521 JSONL rows to tools/corpus/matched-pairs-eur.jsonl. Requested
row:

```json
{"name":"func_02037dc0","module":"main","addr":33783232,"size":548,"c_path":"src/main/func_02037dc0.c","mnemonics":"push sub ldr mov mov cmp addls b"}
```

## Phase 3: decomp.me retry

Request:

```text
https://decomp.me/api/scratch?compiler=mwcc_30_131
```

The API returned HTTP 403 Cloudflare challenge HTML, so this phase stopped as
required. First response lines:

```text
<!DOCTYPE html><html lang="en-US"><head><title>Just a moment...</title><meta http-equiv="Content-Type" content="text/html; charset=UTF-8"><meta http-equiv="X-UA-Compatible" content="IE=Edge"><meta name="robots" content="noindex,nofollow"><meta name="viewport" content="width=device-width, initial-scale=1"><meta http-equiv="content-security-policy" content="default-src &#39;none&#39;; script-src &#39;nonce-WxKvQ7SKcQfCPkiUhFBupg&#39; &#39;unsafe-eval&#39; https://challenges.cloudflare.com; script-src-attr &#39;none&#39;; style-src &#39;unsafe-inline&#39;; img-src &#39;self&#39; https://challenges.cloudflare.com; connect-src &#39;self&#39; https://challenges.cloudflare.com; frame-src https://challenges.cloudflare.com blob:; child-src https://challenges.cloudflare.com blob:; worker-src https://challenges.cloudflare.com blob:; form-action http: https:; base-uri http: https:
```

## Phase 4: naming propagation

Candidate count: **0**. No sampled EUR real-named function had both USA and
JPN twins resolving to placeholder names. The empty table is appended to
naming-census.md.

## Verification

```text
2648 passed, 3 skipped, 13 subtests passed in 11.17s
```
