; func_0209e450 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020928cc
        .extern func_0209dc8c
        .extern func_0209dca8
        .global func_0209e450
        .arm
func_0209e450:
    stmdb sp!, {r4, lr}
    bl func_0209dca8
    mov r4, r0
    bl func_0209dc8c
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, lr}
    bxne lr
    ldr r0, [r4, #0x4]
    mov r1, #0x2
    bl func_020928cc
    ldr r2, [r4, #0x4]
    ldrh r0, [r2]
    cmp r0, #0x9
    beq .L_5a8
    cmp r0, #0xa
    beq .L_5d4
    cmp r0, #0xb
    beq .L_5d4
    b .L_5f0
.L_5a8:
    ldr r0, _LIT0
    mov r1, #0x2
    add r0, r2, r0
    bl func_020928cc
    ldr r2, [r4, #0x4]
    add r0, r2, #0x100
    ldrh r0, [r0, #0x82]
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, lr}
    bxeq lr
.L_5d4:
    add r0, r2, #0xbc
    mov r1, #0x2
    bl func_020928cc
    ldr r0, [r4, #0x4]
    ldrh r0, [r0, #0xbc]
    ldmia sp!, {r4, lr}
    bx lr
.L_5f0:
    mov r0, #0x0
    ldmia sp!, {r4, lr}
    bx lr
_LIT0: .word 0x00000182
