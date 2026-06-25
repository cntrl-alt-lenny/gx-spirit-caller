; func_ov002_0221cf38 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern func_ov002_021de318
        .global func_ov002_0221cf38
        .arm
func_ov002_0221cf38:
    stmdb sp!, {r3, lr}
    ldrh r2, [r0, #0x4]
    mov r1, r2, lsl #0x1d
    movs r1, r1, lsr #0x1f
    movne r0, #0x0
    ldmneia sp!, {r3, pc}
    ldrh r1, [r0, #0x2]
    mov r3, r2, lsl #0x11
    ldr lr, _LIT0
    mov r2, r1, lsl #0x1f
    mov ip, r2, lsr #0x1f
    mov r2, r1, lsl #0x1a
    ldr r1, _LIT1
    and ip, ip, #0x1
    mla lr, ip, r1, lr
    mov r2, r2, lsr #0x1b
    mov r1, #0x14
    mul r1, r2, r1
    add r2, lr, #0x30
    ldr r2, [r2, r1]
    mov r3, r3, lsr #0x17
    mov r1, r2, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r2, r2, lsl #0x12
    mov r1, r1, lsl #0x1
    add r1, r1, r2, lsr #0x1f
    cmp r3, r1
    movne r0, #0x0
    ldmneia sp!, {r3, pc}
    ldr r1, _LIT2
    bl func_ov002_021de318
    mov r0, #0x0
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022cf08c
_LIT1: .word 0x00000868
_LIT2: .word 0x04000400
