; func_0203bbac — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02038c98
        .global func_0203bbac
        .arm
func_0203bbac:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x78]
    cmp r0, #0x0
    beq .L_100
    mov r1, #0x0
    bl func_02038c98
    mov r0, #0x0
    str r0, [r4, #0x78]
.L_100:
    ldr r0, [r4, #0x7c]
    cmp r0, #0x0
    beq .L_11c
    mov r1, #0x0
    bl func_02038c98
    mov r0, #0x0
    str r0, [r4, #0x7c]
.L_11c:
    ldr r0, [r4, #0x80]
    cmp r0, #0x0
    beq .L_138
    mov r1, #0x0
    bl func_02038c98
    mov r0, #0x0
    str r0, [r4, #0x80]
.L_138:
    ldr r0, [r4, #0x84]
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    mov r1, #0x0
    bl func_02038c98
    mov r0, #0x0
    str r0, [r4, #0x84]
    ldmia sp!, {r4, pc}
