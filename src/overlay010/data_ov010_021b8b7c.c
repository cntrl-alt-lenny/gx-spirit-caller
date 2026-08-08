/* data_ov010_021b8b7c (28 bytes, 4-aligned): dispatch table "B" for
 * Ov010_RunFnPtrTable (func_ov010_021b3f98) -- 6 fn-ptr slots + NULL
 * terminator, indexed by data_021040ac[0xb6c] and blx'd.
 * Consumer: src/overlay010/ov010_021b4028.c:12 (Ov010_RunFnPtrTableB;
 * relocs.txt from:0x021b4038 kind:load to:0x021b8b7c).
 * Per-word relocs (ov010/relocs.txt:948-952) prove each non-zero slot:
 *   +0x00 -> func_ov010_021b3c48 (Ov010_OpenMode2)
 *   +0x04 -> func_ov010_021b3c58 (Ov010_OpenMessageWindow)
 *   +0x08 -> func_ov010_021b3ce4 (Ov010_FadeMessageWindow)
 *   +0x0c -> func_ov010_021b3dd8 (Ov010_DispatchModeUpdate)
 *   +0x10 -> func_ov010_021b3ea0 (Ov010_FadeInStep)
 *   +0x14 -> func_ov010_021b3f50 (Ov010_InitManagersTeardown)
 *   +0x18 -> 0 (terminator, no reloc)
 * extern char + cast, matching this project's D-1 recipe precedent
 * (src/overlay006/data_ov006_021cbb08.c, data_ov006_021cbb50.c,
 * src/main/data_0210210c.c). Kept non-const (.data ground truth).
 */

typedef int (*Ov010FnPtrCb)(void);

extern char func_ov010_021b3c48;
extern char func_ov010_021b3c58;
extern char func_ov010_021b3ce4;
extern char func_ov010_021b3dd8;
extern char func_ov010_021b3ea0;
extern char func_ov010_021b3f50;

Ov010FnPtrCb data_ov010_021b8b7c[7] = {
    (Ov010FnPtrCb)&func_ov010_021b3c48,
    (Ov010FnPtrCb)&func_ov010_021b3c58,
    (Ov010FnPtrCb)&func_ov010_021b3ce4,
    (Ov010FnPtrCb)&func_ov010_021b3dd8,
    (Ov010FnPtrCb)&func_ov010_021b3ea0,
    (Ov010FnPtrCb)&func_ov010_021b3f50,
    0,
};
