/* data_ov010_021b8b98 (28 bytes, 4-aligned): dispatch table "A" for
 * Ov010_RunFnPtrTable (func_ov010_021b3f98) -- sibling of
 * data_ov010_021b8b7c, same 5 tail slots, different slot 0.
 * Consumer: src/overlay010/ov010_021b4014.c:12 (Ov010_RunFnPtrTableA;
 * relocs.txt from:0x021b4024 kind:load to:0x021b8b98).
 * Per-word relocs (ov010/relocs.txt:953-959):
 *   +0x00 -> func_ov010_021b3c38 (Ov010_OpenMode1)
 *   +0x04 -> func_ov010_021b3c58 (Ov010_OpenMessageWindow)
 *   +0x08 -> func_ov010_021b3ce4 (Ov010_FadeMessageWindow)
 *   +0x0c -> func_ov010_021b3dd8 (Ov010_DispatchModeUpdate)
 *   +0x10 -> func_ov010_021b3ea0 (Ov010_FadeInStep)
 *   +0x14 -> func_ov010_021b3f50 (Ov010_InitManagersTeardown)
 *   +0x18 -> 0 (terminator, no reloc)
 * Same D-1 recipe as data_ov010_021b8b7c (reuse the Ov010FnPtrCb
 * typedef; both files redeclare it locally, matching the
 * data_ov006_021cbb08.c / data_ov006_021cbb50.c sibling precedent).
 * Kept non-const (.data ground truth).
 */

typedef int (*Ov010FnPtrCb)(void);

extern char func_ov010_021b3c38;
extern char func_ov010_021b3c58;
extern char func_ov010_021b3ce4;
extern char func_ov010_021b3dd8;
extern char func_ov010_021b3ea0;
extern char func_ov010_021b3f50;

Ov010FnPtrCb data_ov010_021b8b98[7] = {
    (Ov010FnPtrCb)&func_ov010_021b3c38,
    (Ov010FnPtrCb)&func_ov010_021b3c58,
    (Ov010FnPtrCb)&func_ov010_021b3ce4,
    (Ov010FnPtrCb)&func_ov010_021b3dd8,
    (Ov010FnPtrCb)&func_ov010_021b3ea0,
    (Ov010FnPtrCb)&func_ov010_021b3f50,
    0,
};
