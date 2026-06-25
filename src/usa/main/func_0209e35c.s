; func_0209e35c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020927e4
        .extern func_0209db98
        .extern func_0209dbb4
        .global func_0209e35c
        .arm
func_0209e35c:
    stmdb sp!, {r4, lr}
    bl func_0209dbb4
    mov r4, r0
    bl func_0209db98
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, lr}
    bxne lr
    ldr r0, [r4, #0x4]
    mov r1, #0x2
    bl func_020927e4
    ldr r2, [r4, #0x4]
    ldrh r0, [r2]
    cmp r0, #0x9
    beq .L_50
    cmp r0, #0xa
    beq .L_7c
    cmp r0, #0xb
    beq .L_7c
    b .L_98
.L_50:
    ldr r0, _LIT0
    mov r1, #0x2
    add r0, r2, r0
    bl func_020927e4
    ldr r2, [r4, #0x4]
    add r0, r2, #0x100
    ldrh r0, [r0, #0x82]
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, lr}
    bxeq lr
.L_7c:
    add r0, r2, #0xbc
    mov r1, #0x2
    bl func_020927e4
    ldr r0, [r4, #0x4]
    ldrh r0, [r0, #0xbc]
    ldmia sp!, {r4, lr}
    bx lr
.L_98:
    mov r0, #0x0
    ldmia sp!, {r4, lr}
    bx lr
_LIT0: .word 0x00000182
