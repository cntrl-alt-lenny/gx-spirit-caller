; func_02061eac — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02045364
        .extern func_020540d4
        .global func_02061eac
        .arm
func_02061eac:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x38]
    cmp r0, #0x0
    beq .L_9c0
    bl func_02045364
.L_9c0:
    ldr r0, [r4, #0x44]
    cmp r0, #0x0
    beq .L_9d0
    bl func_02045364
.L_9d0:
    ldr r0, [r4, #0x50]
    cmp r0, #0x0
    beq .L_9e0
    bl func_02045364
.L_9e0:
    ldr r0, [r4, #0x5c]
    cmp r0, #0x0
    beq .L_9f0
    bl func_020540d4
.L_9f0:
    ldr r0, [r4, #0x60]
    cmp r0, #0x0
    beq .L_a00
    bl func_020540d4
.L_a00:
    ldr r0, [r4, #0x98]
    cmp r0, #0x0
    beq .L_a10
    bl func_020540d4
.L_a10:
    ldr r0, [r4, #0x9c]
    cmp r0, #0x0
    beq .L_a20
    bl func_020540d4
.L_a20:
    mov r0, r4
    bl func_02045364
    ldmia sp!, {r4, pc}
