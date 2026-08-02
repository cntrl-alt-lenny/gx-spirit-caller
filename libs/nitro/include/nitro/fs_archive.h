/*
 * nitro/fs_archive.h — ROM-card/debugger-cartridge archive descriptor
 * (FSArchive).
 *
 * cm-bss-convert-9. Derived directly from this game's own codegen, not
 * copied from an external reference. `func_02098478` (src/main/,
 * already vendored as `FS_Init` -> `FSi_InitRom` per the existing
 * `libs/nitro/FS_Init.legacy.c`, itself citing upstream
 * pokediamond:arm9/lib/NitroSDK/src/FS_file.c -- the real file where
 * NitroSDK's FSArchive lives) branches on a boot-device-type flag and
 * installs one of two backend function-pointer sets into this object.
 * Field roles, cross-validated across ~7 already-matched/shipped
 * consumers:
 *   +0x00 pad (12B, memset-only, no consumer touches it)
 *   +0x0c/+0x10 a volatile int pair, role unconfirmed beyond "paired"
 *   +0x14 waitQueue (OSThreadQueue) -- blocked threads, via the same
 *         OSi_InsertLinkToQueue primitive OSMutex/OSMessageQueue use
 *   +0x1c flags (state bits 0x2/0x4/0x8/0x10/0x20/0x40)
 *   +0x20 pad (4B, memset-only)
 *   +0x24 pendingList -- request/completion list head
 *   +0x28 mapBase -- mapped-region base address
 *   +0x2c/+0x30 region1Ptr/Size, +0x34/+0x38 region2Ptr/Size
 *   +0x3c/+0x40 region1Init/region2Init callbacks
 *   +0x44 lastOffset
 *   +0x48/+0x4c default read/write-style callbacks
 *   +0x50 callbackC -- initialized from +0x48, overwritable per-call
 *         (this is the field cm-bss-convert-4 originally flagged as
 *         "categorically incompatible with flat typing")
 *   +0x54 procHandler -- self->procHandler(node, cmd) dispatcher,
 *         set to one of two boot-device-specific backends
 *   +0x58 modeBits -- -1 (card) / 0x602 (debugger cartridge)
 * Total 0x5c (92) bytes. Field layout matches this game's own
 * observed behavior exactly; two small byte ranges (+0x00..+0x0b,
 * +0x20..+0x23) are never touched by any traced consumer beyond the
 * blanket init memset and are left as honest padding at the carve
 * site rather than guessed here.
 */

#ifndef NITRO_FS_ARCHIVE_H_
#define NITRO_FS_ARCHIVE_H_

#include <nitro/types.h>
#include <nitro/os_thread.h>

#ifdef __cplusplus
extern "C" {
#endif


typedef struct FSArchive {
    char           pad_00[0xc];  /* +0x00: unconfirmed (memset-only) */
    s32            unk0c;        /* +0x0c: volatile, paired w/ +0x10 */
    s32            unk10;        /* +0x10: volatile, paired w/ +0x0c */
    OSThreadQueue  waitQueue;    /* +0x14: blocked threads */
    u32            flags;        /* +0x1c */
    char           pad_20[0x4];  /* +0x20: unconfirmed (memset-only) */
    void          *pendingList;  /* +0x24 */
    void          *mapBase;      /* +0x28 */
    void          *region1Ptr;   /* +0x2c */
    u32            region1Size;  /* +0x30 */
    void          *region2Ptr;   /* +0x34 */
    u32            region2Size;  /* +0x38 */
    void          *region1Init;  /* +0x3c */
    void          *region2Init;  /* +0x40 */
    u32            lastOffset;   /* +0x44 */
    void          *callbackA;    /* +0x48 */
    void          *callbackB;    /* +0x4c */
    void          *callbackC;    /* +0x50 */
    void          *procHandler;  /* +0x54 */
    s32            modeBits;     /* +0x58 */
} FSArchive;                     /* 0x5c (92) bytes */


#ifdef __cplusplus
}
#endif

#endif /* NITRO_FS_ARCHIVE_H_ */
