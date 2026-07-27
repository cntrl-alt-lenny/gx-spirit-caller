/* data_021023c0 (24 bytes, 4-aligned): retyped from opaque bytes to a
 * partial-evidence struct as part of cm-data-inference-11, resolving a
 * wave-5 WEAK decline under this campaign's newer partial-struct
 * standard (waves 8-10). func_0208aec8.s: offset 0 is a `mode` selector
 * (int, read+compared+written), offset 4 is a code pointer written by
 * a 5-way switch on `mode` (never called through in any literal
 * consumer found, hence a plain function-pointer type rather than a
 * proven signature). Offsets 8-23 have zero relocations and zero
 * consumers -- kept as an honest opaque gap. The `-1`/`0` initial
 * values match an idempotent "unset sentinel" / "no handler yet"
 * pattern the consumer's own compare-then-overwrite logic implies.
 * USA/JPN's same-named/same-address symbol is independently confirmed
 * unrelated (EUR's own fully-matched OSi_PostIrqEvent.legacy.c names a
 * wholly different real analog, data_021024a0) -- moot for build safety
 * regardless, since this unprefixed src/main/ file is EUR-only by the
 * same tools/configure.py exclusion rule already used to resolve
 * data_02102120 (wave 10).
 */

typedef void (*ModeHandlerFn)(void);

typedef struct {
    int mode;
    ModeHandlerFn handler;
    unsigned char gap[16];
} ModeHandlerSlot021023c0;

ModeHandlerSlot021023c0 data_021023c0 = {
    -1, 0, { 0 },
};
