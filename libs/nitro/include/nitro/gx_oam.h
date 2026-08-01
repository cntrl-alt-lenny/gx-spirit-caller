/*
 * nitro/gx_oam.h — hardware OAM (sprite) attribute entry (GXOamAttr).
 *
 * cm-bss-convert-8. Derived directly from this game's own codegen, not
 * copied from an external reference: `func_0207f934` (src/main/) reads
 * a source table at an exact 6-byte stride as three consecutive `u16`
 * values (`ldrh` at +0, +2, +4 -- attr0/attr1/attr2) and writes them
 * into a destination array at an 8-byte stride. Two independent,
 * already-decompiled callers (`func_0201e964`, `func_0201eaa0`, both
 * src/main/) pass a literal `.bss` array as that destination and
 * separately patch hardware-shaped bits (rotation-select/shape masks)
 * into individual entries via plain load/bic/orr/store, never through
 * C bitfields. This matches real NDS OAM's own hardware layout (each
 * entry is 3 significant halfwords -- Y/shape/mode, X/rotation/size,
 * tile/priority/palette -- packed into a 4-halfword/8-byte hardware
 * stride, the 4th halfword reserved) and NitroSDK's own convention of
 * exposing OAM attributes as plain integer fields plus separate
 * bit-manipulation helpers, not compiler bitfields -- so a plain
 * 4x`u16` struct is both what the evidence directly shows and the
 * conventional shape for this exact type. Field layout MUST match the
 * observed 8-byte stride exactly.
 */

#ifndef NITRO_GX_OAM_H_
#define NITRO_GX_OAM_H_

#include <nitro/types.h>

#ifdef __cplusplus
extern "C" {
#endif


/* GXOamAttr — one hardware OAM (sprite) entry, 8 bytes.
 * attr0/attr1/attr2 are the three significant hardware halfwords;
 * the 4th is unused/reserved padding to reach the real 8-byte
 * per-entry hardware stride. */
typedef struct GXOamAttr {
    u16 attr0;
    u16 attr1;
    u16 attr2;
    u16 reserved;
} GXOamAttr;


#ifdef __cplusplus
}
#endif

#endif /* NITRO_GX_OAM_H_ */
