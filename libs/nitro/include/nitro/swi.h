/*
 * nitro/swi.h — ARM9 software-interrupt (BIOS) thunks.
 *
 * These are the first 18 named functions in ARM9 main, sitting at
 * 0x02000086 .. 0x020007ea in the EUR baserom. Each is a short thumb
 * thunk that issues a single `swi #N` and returns; the signatures below
 * match GBATEK's documented BIOS API, and are what dqix / pokeplatinum /
 * NitroSDK-Decomp use verbatim.
 *
 * Implementations will live in libs/nitro/swi/*.c when someone writes them.
 * No .c files are checked in yet — header-only for now.
 */

#ifndef NITRO_SWI_H_
#define NITRO_SWI_H_

#include <nitro/types.h>

#ifdef __cplusplus
extern "C" {
#endif

/* ---- CPU core / power management ---------------------------------------- */

void SoftReset(void);
void Halt(void);
void WaitByLoop(s32 count);
BOOL IsDebugger(void);

/* ---- Interrupt waits ---------------------------------------------------- */

/* Wait for any of the interrupts in `intrFlag` (bitmask of OS_IE_*).
 * `waitFlag` selects clear-on-entry (TRUE) vs check-existing (FALSE). */
void IntrWait(BOOL waitFlag, u32 intrFlag);
void VBlankIntrWait(void);

/* ---- Arithmetic --------------------------------------------------------- */

s32  Div(s32 numer, s32 denom);
s32  Mod(s32 numer, s32 denom);
u32  Sqrt(u32 x);

/* ---- Memory copy / fill ------------------------------------------------- */

/* `lenMode` follows the BIOS convention: low 21 bits are the word count,
 * bit 24 selects fill-vs-copy, bit 26 selects 32- vs 16-bit transfer. */
void CpuSet(const void *src, void *dst, u32 lenMode);
void CpuFastSet(const void *src, void *dst, u32 lenMode);

/* ---- CRC / hash --------------------------------------------------------- */

u16  GetCRC16(u16 start, const void *data, u32 size);

/* ---- BIOS decompressors ------------------------------------------------- */

/* The BIOS decompressor API takes a header pointer, a destination, and —
 * for the callback variants — a struct of read/write callbacks. We leave
 * the callback struct opaque here; callers that need it can declare it
 * locally or we'll pull in nitro/mi.h once it exists. */
struct BitUnpackParam;

void BitUnPack(const void *src, void *dst, const struct BitUnpackParam *param);

void LZ77UnCompReadNormalWrite8bit(const void *src, void *dst);
void LZ77UnCompReadByCallbackWrite16bit(const void *src, void *dst,
                                        const void *cbParam, const void *cbFuncs);

void RLUnCompReadNormalWrite8bit(const void *src, void *dst);
void RLUnCompReadByCallbackWrite16bit(const void *src, void *dst,
                                      const void *cbParam, const void *cbFuncs);

void HuffUnCompReadByCallback(const void *src, void *dst,
                              const void *cbParam, const void *cbFuncs);

#ifdef __cplusplus
}
#endif

#endif /* NITRO_SWI_H_ */
