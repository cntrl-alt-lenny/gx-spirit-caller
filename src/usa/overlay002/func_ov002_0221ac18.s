; func_ov002_0221ac18 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0c4
        .extern func_ov002_021de3c0
        .extern func_ov002_022574ac
        .global func_ov002_0221ac18
        .arm
func_ov002_0221ac18:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldrh r5, [r4, #0x2]
    ldr r2, _LIT0
    ldrh ip, [r4, #0x4]
    mov r3, r5, lsl #0x1f
    mov r3, r3, lsr #0x1f
    and r3, r3, #0x1
    mov lr, r5, lsl #0x1a
    mul r2, r3, r2
    ldr r5, _LIT1
    mov lr, lr, lsr #0x1b
    mov r3, #0x14
    add r5, r5, r2
    mul r3, lr, r3
    add r5, r5, #0x30
    ldr lr, [r5, r3]
    mov r5, ip, lsl #0x11
    mov ip, lr, lsl #0x2
    mov ip, ip, lsr #0x18
    mov lr, lr, lsl #0x12
    mov ip, ip, lsl #0x1
    mov r5, r5, lsr #0x17
    add ip, ip, lr, lsr #0x1f
    cmp r5, ip
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    ldr ip, _LIT2
    add r2, ip, r2
    ldrh r2, [r3, r2]
    cmp r2, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    bl func_ov002_022574ac
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r1, [r4, #0x14]
    mov r0, r4
    mov r3, r1, lsl #0x16
    mov r2, r1, lsl #0x12
    mov r1, r3, lsr #0x1f
    mov r2, r2, lsr #0x1c
    bl func_ov002_021de3c0
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf08c
_LIT2: .word data_ov002_022cf0c4
