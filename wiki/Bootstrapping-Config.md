# Bootstrapping `config/<ver>/`

A one-off manual step, run once per region, before anything else works.

> [!NOTE]
> `dsd init` is **not** wired into the Ninja graph. It's a rare,
> structural operation — not something you run every build.

## Prerequisite

You must have already run `ninja extract/<ver>/config.yaml`, which
produces `extract/<ver>/config.yaml` from your baserom.

## The Command

```bash
./dsd init \
    --rom-config extract/eur/config.yaml \
    --output-path config/eur \
    --build-path build/eur \
    --allow-unknown-function-calls
```

Substitute the region (`usa`, `eur`, `jpn`) in all three paths.

## Why `--allow-unknown-function-calls`?

The stock run of `dsd init` fails on this game with:

```
Local function call from 0x021aaed4 in overlay 0 to 0x021b3810
leads to no function
```

Cause: overlay 0 and overlay 2 share base address `0x021aaee0` — an
overlay-swap pattern that dsd's current analysis can't model.

The (hidden) `--allow-unknown-function-calls` flag bypasses the error
by injecting placeholder symbols at the unresolved addresses. Those
symbols get replaced as real analysis progresses and cross-module
relocations are manually filled in.

## Upstream Status

Tracked in [ds-decomp#58](https://github.com/AetiasHax/ds-decomp/issues/58),
related to open issues #17 / #20 / #23. Expect the workaround to
become unnecessary once dsd's analyzer grows overlay-swap awareness.

## After `dsd init`

You'll now have `config/<ver>/` populated with:

- Per-module `config.yaml` files
- `symbols.txt` per module (every function, named `func_<addr>` until matched)
- Relocation tables
- Delink scripts used by `ninja`

From here, `ninja` will pick up automatically. See [Build Status](Build-Status)
for what currently round-trips byte-identically and what still diffs
due to the placeholder symbols.
