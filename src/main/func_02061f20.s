; func_02061f20 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020453b4
        .extern func_02054148
        .global func_02061f20
        .arm
func_02061f20:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x38]
    cmp r0, #0x0
    beq .L_9f8
    bl func_020453b4
.L_9f8:
    ldr r0, [r4, #0x44]
    cmp r0, #0x0
    beq .L_a08
    bl func_020453b4
.L_a08:
    ldr r0, [r4, #0x50]
    cmp r0, #0x0
    beq .L_a18
    bl func_020453b4
.L_a18:
    ldr r0, [r4, #0x5c]
    cmp r0, #0x0
    beq .L_a28
    bl func_02054148
.L_a28:
    ldr r0, [r4, #0x60]
    cmp r0, #0x0
    beq .L_a38
    bl func_02054148
.L_a38:
    ldr r0, [r4, #0x98]
    cmp r0, #0x0
    beq .L_a48
    bl func_02054148
.L_a48:
    ldr r0, [r4, #0x9c]
    cmp r0, #0x0
    beq .L_a58
    bl func_02054148
.L_a58:
    mov r0, r4
    bl func_020453b4
    ldmia sp!, {r4, pc}
