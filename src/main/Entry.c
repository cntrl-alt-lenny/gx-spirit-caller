/* Entry: CRT entrypoint, ARM-mode, 0x13c bytes.
 *
 * Called by the NDS ROM header's ARM9 reset vector. Does the full
 * startup sequence: polls a hardware register for sync, runs the
 * CP15/MPU setup thunk (func_02000a78), sets up three separate
 * stacks for SVC / IRQ / SYS CPU modes, zeros main RAM / WRAM / ITCM
 * regions, invalidates the data/instruction cache, patches the IRQ
 * vector table to jump to func_01ff8180, runs three runtime init
 * hooks, then tail-calls `main` with `lr = 0xffff0000` so that if
 * main ever returns the CPU jumps into the BIOS exception area.
 *
 * Full disassembly (from build/eur/asm/_dsd_gap@main_8.s):
 *
 *     Entry:
 *         mov ip, #0x4000000             ; ip = IO_BASE
 *         str ip, [ip, #0x208]           ; REG_IME = 0x04000000 (any
 *                                          non-zero value — disables
 *                                          then enables master IRQ)
 *     .L_02000808:
 *         ldrh r0, [ip, #0x6]            ; poll REG_VCOUNT-ish
 *         cmp r0, #0x0
 *         bne .L_02000808
 *         bl func_02000a78               ; CP15 / MPU setup
 *         mov r0, #0x13                  ; Mode: SVC
 *         msr cpsr_c, r0
 *         ldr r0, =data_027e0000
 *         add r0, r0, #0x3fc0
 *         mov sp, r0                     ; SVC stack
 *         mov r0, #0x12                  ; Mode: IRQ
 *         msr cpsr_c, r0
 *         ldr r0, =data_027e0000
 *         add r0, r0, #0x3fc0
 *         sub r0, r0, #0x40
 *         sub sp, r0, #0x4
 *         tst sp, #0x4
 *         subeq sp, sp, #0x4             ; IRQ stack, 8-byte aligned
 *         ldr r1, =0x400
 *         sub r1, r0, r1
 *         mov r0, #0x1f                  ; Mode: SYS
 *         msr cpsr_fsxc, r0
 *         sub sp, r1, #0x4               ; SYS stack
 *
 *         mov r0, #0x0                   ; fill value = 0
 *         ldr r1, =data_027e0000         ; dst = main RAM base
 *         mov r2, #0x4000                ; count = 0x4000 bytes
 *         bl func_0200093c               ; memset
 *         mov r0, #0x0
 *         ldr r1, =0x5000000             ; dst = palette RAM
 *         mov r2, #0x400
 *         bl func_0200093c
 *         mov r0, #0x200                 ; fill = 0x200
 *         ldr r1, =0x7000000             ; dst = OAM
 *         mov r2, #0x400
 *         bl func_0200093c
 *
 *         ldr r1, =BuildInfo             ; runtime layout descriptor
 *         ldr r0, [r1, #0x14]            ; autoload-entry count?
 *         bl func_02000950               ; process autoloads
 *         bl func_020009fc
 *         ldr r0, =BuildInfo
 *         ldr r1, [r0, #0xc]             ; bss_start
 *         ldr r2, [r0, #0x10]            ; bss_end
 *         mov r3, r1
 *         mov r0, #0x0
 *     .L_020008b4:                       ; word-by-word bss clear
 *         cmp r1, r2
 *         strlo r0, [r1], #0x4
 *         blo .L_020008b4
 *         bic r1, r3, #0x1f
 *     .L_020008c4:                       ; cache invalidate loop
 *         mcr p15, #0, r0, c7, c10, #4   ; drain write buffer
 *         mcr p15, #0, r1, c7, c5, #1    ; invalidate I-cache line
 *         mcr p15, #0, r1, c7, c14, #1   ; clean+invalidate D-cache line
 *         add r1, r1, #0x20
 *         cmp r1, r2
 *         blt .L_020008c4
 *         ldr r1, =0x27fff9c             ; IRQ vector slot
 *         str r0, [r1, #0x0]             ; *vec = 0 (disable)
 *         ldr r1, =data_027e0000
 *         add r1, r1, #0x3fc0
 *         add r1, r1, #0x3c              ; + 0x3ffc = end of stack area
 *         ldr r0, =func_01ff8180         ; IRQ handler in ITCM
 *         str r0, [r1, #0x0]
 *         bl func_020b41bc               ; runtime init hook 1
 *         bl func_02000b64               ; runtime init hook 2 (ctor-list runner)
 *         bl func_020b4284               ; runtime init hook 3
 *         ldr r1, =main                  ; target = C main
 *         ldr lr, =0xffff0000            ; lr = BIOS error trap address
 *         tst sp, #0x4
 *         subne sp, sp, #0x4             ; 8-byte align before handoff
 *         bx r1                          ; tail-call main
 *
 * Why `asm void`: this body is dominated by
 *   - CP15 coprocessor instructions (`mcr p15, ...`) for cache/MPU
 *   - CPSR mode switches (`msr cpsr_c, ...`) across SVC/IRQ/SYS
 *   - direct stack-pointer manipulation across modes
 *   - a tail-call via `bx r1` with `lr` preloaded to 0xffff0000
 * None of these are expressible in portable C, and mwcc has no
 * intrinsics for CPSR / CP15 that would produce the exact baserom
 * byte sequence. Same family of escape hatch as brief 009's
 * sinit ov002 outlier and brief 011's SWI thunks.
 */

extern void func_02000a78(void);
extern void func_0200093c(int val, void *dst, int count);
extern void func_02000950(int count);
extern void func_020009fc(void);
extern void func_020b41bc(void);
extern void func_02000b64(void);
extern void func_020b4284(void);
extern void func_01ff8180(void);
extern void main(void);

extern char data_027e0000[];
extern char BuildInfo[];

asm void Entry(void) {
    nofralloc
    mov  ip, #0x4000000
    str  ip, [ip, #0x208]
wait_sync:
    ldrh r0, [ip, #0x6]
    cmp  r0, #0x0
    bne  wait_sync
    bl   func_02000a78
    mov  r0, #0x13
    msr  cpsr_c, r0
    ldr  r0, =data_027e0000
    add  r0, r0, #0x3fc0
    mov  sp, r0
    mov  r0, #0x12
    msr  cpsr_c, r0
    ldr  r0, =data_027e0000
    add  r0, r0, #0x3fc0
    sub  r0, r0, #0x40
    sub  sp, r0, #0x4
    tst  sp, #0x4
    subeq sp, sp, #0x4
    ldr  r1, =0x400
    sub  r1, r0, r1
    mov  r0, #0x1f
    msr  cpsr_fsxc, r0
    sub  sp, r1, #0x4
    mov  r0, #0x0
    ldr  r1, =data_027e0000
    mov  r2, #0x4000
    bl   func_0200093c
    mov  r0, #0x0
    ldr  r1, =0x5000000
    mov  r2, #0x400
    bl   func_0200093c
    mov  r0, #0x200
    ldr  r1, =0x7000000
    mov  r2, #0x400
    bl   func_0200093c
    ldr  r1, =BuildInfo
    ldr  r0, [r1, #0x14]
    bl   func_02000950
    bl   func_020009fc
    ldr  r0, =BuildInfo
    ldr  r1, [r0, #0xc]
    ldr  r2, [r0, #0x10]
    mov  r3, r1
    mov  r0, #0x0
bss_clear:
    cmp  r1, r2
    strlo r0, [r1], #0x4
    blo  bss_clear
    bic  r1, r3, #0x1f
cache_inv:
    mcr  p15, 0, r0, c7, c10, 4
    mcr  p15, 0, r1, c7, c5, 1
    mcr  p15, 0, r1, c7, c14, 1
    add  r1, r1, #0x20
    cmp  r1, r2
    blt  cache_inv
    ldr  r1, =0x27fff9c
    str  r0, [r1, #0x0]
    ldr  r1, =data_027e0000
    add  r1, r1, #0x3fc0
    add  r1, r1, #0x3c
    ldr  r0, =func_01ff8180
    str  r0, [r1, #0x0]
    bl   func_020b41bc
    bl   func_02000b64
    bl   func_020b4284
    ldr  r1, =main
    ldr  lr, =0xffff0000
    tst  sp, #0x4
    subne sp, sp, #0x4
    bx   r1
}
