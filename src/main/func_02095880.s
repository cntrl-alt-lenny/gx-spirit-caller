; func_02095880 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02095344
        .extern func_0209538c
        .extern func_020953e4
        .extern func_020954b4
        .extern func_02095678
        .extern func_0209591c
        .global func_02095880
        .arm
func_02095880:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_02095344
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, lr}
    bxeq lr
    bl func_0209538c
    cmp r0, #0x0
    ldmneia sp!, {r4, lr}
    bxne lr
    ands r0, r4, #0x1
    moveq r0, #0x0
    ldmeqia sp!, {r4, lr}
    bxeq lr
    bl func_020954b4
    cmp r0, #0x0
    ble .L_70
    mov r4, #0x0
.L_4c:
    mov r0, r4
    bl func_0209591c
    cmp r0, #0x0
    bne .L_4c
    bl func_0209538c
    cmp r0, #0x0
    beq .L_78
    ldmia sp!, {r4, lr}
    bx lr
.L_70:
    mov r0, #0x1
    bl func_02095678
.L_78:
    bl func_020953e4
    mov r4, #0x1
.L_80:
    mov r0, r4
    bl func_0209591c
    bl func_0209538c
    cmp r0, #0x0
    beq .L_80
    ldmia sp!, {r4, lr}
    bx lr
