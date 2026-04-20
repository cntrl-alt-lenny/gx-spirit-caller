/*
 * nitro/types.h — primitive typedefs used across the NitroSDK.
 *
 * These names are load-bearing: the rest of libs/nitro/ and eventually
 * most of src/ will rely on exactly `u32`, `s16`, `vu32`, `BOOL`, etc.,
 * because that's what the NitroSDK does. Changing them later would mean
 * editing every decomp'd file.
 */

#ifndef NITRO_TYPES_H_
#define NITRO_TYPES_H_

#ifdef __cplusplus
extern "C" {
#endif

/* Fixed-width integers — match NitroSDK naming, not stdint.h. */
typedef unsigned char       u8;
typedef unsigned short      u16;
typedef unsigned long       u32;
typedef unsigned long long  u64;

typedef signed char         s8;
typedef signed short        s16;
typedef signed long         s32;
typedef signed long long    s64;

/* Volatile variants, for memory-mapped I/O registers. */
typedef volatile u8         vu8;
typedef volatile u16        vu16;
typedef volatile u32        vu32;
typedef volatile u64        vu64;

typedef volatile s8         vs8;
typedef volatile s16        vs16;
typedef volatile s32        vs32;
typedef volatile s64        vs64;

/* Floating point. The DS has no FPU — f32/f64 end up going through the
 * mwcc soft-float runtime. Fixed-point (fx16/fx32/fx64) is what most
 * NitroSDK math actually uses. */
typedef float               f32;
typedef double              f64;

typedef s16                 fx16;   /* 1.3.12 */
typedef s32                 fx32;   /* 1.19.12 */
typedef s64                 fx64;   /* 1.51.12 */
typedef s64                 fx64c;  /* 1.19.44 "compact" */

/* Classic Windows-style BOOL — NitroSDK headers use this verbatim. */
typedef int                 BOOL;

#ifndef TRUE
#define TRUE  1
#endif
#ifndef FALSE
#define FALSE 0
#endif

#ifndef NULL
#define NULL ((void *)0)
#endif

#ifdef __cplusplus
}
#endif

#endif /* NITRO_TYPES_H_ */
