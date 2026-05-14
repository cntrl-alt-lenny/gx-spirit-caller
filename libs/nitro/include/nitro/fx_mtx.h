/*
 * nitro/fx_mtx.h — fixed-point matrix types (Mtx22/33/43/44).
 *
 * Brief 072 follow-up (D6). Pokediamond's `include/nitro/FX_types.h`
 * defines these with a struct tag (`Mtx44` etc.) and a typedef
 * alias (`MtxFx44` etc.):
 *
 *     typedef struct Mtx44 { fx32 _[16]; } MtxFx44;
 *
 * Indexing is column-major: `_[col * rows + row]` per
 * pokediamond's note "Matrices are indexed as [column][row]".
 *
 * Mtx44 / Mtx43 / Mtx33 are the standard NDS rendering matrices;
 * Mtx22 covers 2D rotations + decomp-time skew calcs.
 *
 * Field layout MUST match upstream byte-for-byte — verified by
 * brief 071's byte-identity gate.
 */

#ifndef NITRO_FX_MTX_H_
#define NITRO_FX_MTX_H_

#include <nitro/types.h>

#ifdef __cplusplus
extern "C" {
#endif


/* Mtx44 — 4×4 fixed-point matrix.
 * Storage: 16 fx32 entries, column-major. */
typedef struct Mtx44 {
    fx32 _[16];
} MtxFx44;


/* Mtx43 — 4×3 fixed-point matrix.
 * Storage: 12 fx32 entries, column-major. */
typedef struct Mtx43 {
    fx32 _[12];
} MtxFx43;


/* Mtx33 — 3×3 fixed-point matrix.
 * Storage: 9 fx32 entries, column-major. */
typedef struct Mtx33 {
    fx32 _[9];
} MtxFx33;


/* Mtx22 — 2×2 fixed-point matrix.
 * Storage: 4 fx32 entries, column-major. */
typedef struct Mtx22 {
    fx32 _[4];
} MtxFx22;


#ifdef __cplusplus
}
#endif

#endif /* NITRO_FX_MTX_H_ */
