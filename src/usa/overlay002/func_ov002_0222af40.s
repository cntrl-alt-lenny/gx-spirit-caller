; func_ov002_0222af40 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern func_ov002_021b9950
        .extern func_ov002_021d7df4
        .extern func_ov002_0223de04
        .global func_ov002_0222af40
        .arm
func_ov002_0222af40:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh r1, [r4, #0x6]
    mov r1, r1, lsl #0x10
    movs r1, r1, lsr #0x18
    beq .L_2d0
    sub r1, r1, #0x1
    bl func_ov002_0223de04
    ldrh r2, [r4, #0x2]
    mov r1, r0
    mov r0, r2, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021b9950
    movs ip, r0
    bmi .L_29c
    ldrh r1, [r4, #0x2]
    ldr r3, _LIT0
    ldr r0, _LIT1
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    and r2, r1, #0x1
    mla r0, r2, r0, r3
    add r2, r0, #0x5d0
    mov r0, r4
    add r2, r2, ip, lsl #0x2
    bl func_ov002_021d7df4
.L_29c:
    ldrh r2, [r4, #0x6]
    mov r0, #0x80
    mov r1, r2, lsl #0x10
    mov r1, r1, lsr #0x18
    add r1, r1, #0xff
    add r1, r1, #0xff00
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    bic r2, r2, #0xff00
    mov r1, r1, lsl #0x18
    orr r1, r2, r1, lsr #0x10
    strh r1, [r4, #0x6]
    ldmia sp!, {r4, pc}
.L_2d0:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022cf08c
_LIT1: .word 0x00000868
