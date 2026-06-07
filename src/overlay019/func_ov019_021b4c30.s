; func_ov019_021b4c30 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov019_021b4c74
        .extern func_ov019_021b4fdc
        .global func_ov019_021b4c30
        .arm
func_ov019_021b4c30:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0xb8]
    cmp r1, #0x0
    beq .L_200
    bl func_ov019_021b4c74
    b .L_220
.L_200:
    ldr r1, [r4, #0xbc]
    cmp r1, #0x0
    beq .L_210
    bl func_ov019_021b4fdc
.L_210:
    ldr r0, [r4, #0xc4]
    cmp r0, #0x50
    addlt r0, r0, #0x10
    strlt r0, [r4, #0xc4]
.L_220:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
