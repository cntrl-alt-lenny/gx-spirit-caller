/*
 * nitro/fx_vec.h — fixed-point vector types (Vecx32 / Vecx16).
 *
 * Brief 072 follow-up (D6). Pokediamond's `include/nitro/FX_types.h`
 * defines these with a struct tag (`Vecx32`, `Vecx16`) and a
 * typedef alias (`VecFx32`, `VecFx16`):
 *
 *     typedef struct Vecx32 { fx32 x, y, z; } VecFx32;
 *
 * The dual-name pattern means upstream `.c` sources can write
 * either `struct Vecx32 v;` or `VecFx32 v;` — both are valid.
 * We mirror this exactly so the port driver's struct-hint scan
 * picks up either name from upstream source bodies.
 *
 * Pre-D6 only forward decls existed in `nitro/fx.h`; brief 072's
 * smoke-test showed Vecx32 / Mtx43 / Mtx44 in the top-15
 * unvendored struct hints after D5 (~13 candidate instances).
 *
 * Field layout MUST match upstream byte-for-byte — verified by
 * brief 071's byte-identity gate when these structs participate
 * in a port.
 */

#ifndef NITRO_FX_VEC_H_
#define NITRO_FX_VEC_H_

#include <nitro/types.h>

#ifdef __cplusplus
extern "C" {
#endif


/* Vecx32 — 3D vector in fx32 (1.19.12 fixed-point). The struct
 * tag is `Vecx32`; the typedef alias `VecFx32` is the more
 * commonly-used name in NitroSDK source. */
typedef struct Vecx32 {
    fx32 x;
    fx32 y;
    fx32 z;
} VecFx32;


/* Vecx16 — 3D vector in fx16 (1.3.12 fixed-point). Same
 * dual-name pattern. */
typedef struct Vecx16 {
    fx16 x;
    fx16 y;
    fx16 z;
} VecFx16;


#ifdef __cplusplus
}
#endif

#endif /* NITRO_FX_VEC_H_ */
