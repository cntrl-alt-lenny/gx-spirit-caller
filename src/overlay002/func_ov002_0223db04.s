; func_ov002_0223db04 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022d0250
        .global func_ov002_0223db04
        .arm
func_ov002_0223db04:
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0x4
    ldr r5, _LIT0
    ldr r3, _LIT1
    and r4, r1, #0x1
    mla r5, r4, r3, r5
    ldrh r6, [sp]
    mov ip, #0x14
    mov r1, r1, lsl #0x10
    mov r4, r1, lsr #0x10
    mov r1, r2, lsl #0x10
    mov r3, r1, lsr #0x10
    mul r1, r2, ip
    add r2, r5, #0x30
    ldr r5, [r2, r1]
    bic r2, r6, #0x1
    and r1, r4, #0x1
    orr r1, r2, r1
    ldrh lr, [r0, #0x6]
    strh r1, [sp]
    ldrh r6, [sp]
    mov r1, r5, lsl #0x2
    mov r4, r1, lsr #0x18
    mov r1, lr, lsl #0x10
    mov r1, r1, lsr #0x18
    add r2, r1, #0x1
    mov r2, r2, lsl #0x10
    mov ip, r2, lsr #0x10
    bic r6, r6, #0x1e
    mov r2, r3, lsl #0x1c
    orr r2, r6, r2, lsr #0x1b
    strh r2, [sp]
    mov r3, r5, lsl #0x12
    mov r2, r4, lsl #0x1
    add r2, r2, r3, lsr #0x1f
    mov r2, r2, lsl #0x10
    mov r3, r2, lsr #0x10
    ldrh r4, [sp]
    ldr r2, _LIT2
    mov r3, r3, lsl #0x17
    and r2, r4, r2
    orr r2, r2, r3, lsr #0x12
    strh r2, [sp]
    ldrh r2, [sp]
    ldr r3, _LIT3
    bic lr, lr, #0xff00
    mov r4, r2, lsl #0x12
    mov r4, r4, lsr #0x17
    mov r4, r4, lsl #0x2
    ldrh r4, [r3, r4]
    mov r3, ip, lsl #0x18
    orr r3, lr, r3, lsr #0x10
    mov r4, r4, lsl #0x11
    mov r4, r4, lsr #0x1e
    bic ip, r2, #0xc000
    mov r2, r4, lsl #0x1e
    orr r2, ip, r2, lsr #0x10
    strh r2, [sp]
    ldrh r2, [sp]
    strh r3, [r0, #0x6]
    add r0, r0, r1, lsl #0x1
    strh r2, [r0, #0x8]
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, pc}
_LIT0: .word data_ov002_022cf16c
_LIT1: .word 0x00000868
_LIT2: .word 0xffffc01f
_LIT3: .word data_ov002_022d0250
