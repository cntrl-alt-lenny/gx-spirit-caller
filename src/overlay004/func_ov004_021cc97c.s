; func_ov004_021cc97c - whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov004_0220b500
        .extern data_ov004_022915e8
        .extern func_0201d050
        .extern func_0201d364
        .extern func_0201d384
        .extern func_0202046c
        .extern func_02037208
        .extern func_0208e0a0
        .extern func_02094504
        .global func_ov004_021cc97c
        .arm
func_ov004_021cc97c:
    stmdb sp!, {r4, lr}
    ldr r4, _LIT0
    mov r0, #0x0
    str r0, [r4, #0x9c]
    str r0, [r4, #0xa0]
    bl func_0202046c
    cmp r0, #0x0
    beq .L_1f0
    bl func_0201d364
    mov r0, #0x0
    bl func_0201d050
    b .L_1f4
.L_1f0:
    bl func_0201d384
.L_1f4:
    ldr r0, _LIT1
    ldr r0, [r0]
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    bne .L_23c
    bl func_0202046c
    cmp r0, #0x0
    movne r0, #0x1
    strne r0, [r4, #0x54]
    moveq r0, #0xb
    streq r0, [r4, #0x48]
    mov r0, #0x42
    sub r1, r0, #0x43
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
.L_23c:
    ldr r0, [r4, #0x94]
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    bl func_0208e0a0
    add r1, r0, #0x200
    mov r0, #0x0
    mov r2, #0x280
    bl func_02094504
    mov r0, #0x0
    str r0, [r4, #0x94]
    str r0, [r4, #0x74]
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov004_0220b500
_LIT1: .word data_ov004_022915e8
