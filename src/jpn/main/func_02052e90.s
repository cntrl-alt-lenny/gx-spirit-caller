; func_02052e90 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02053440
        .extern func_02053460
        .extern func_02053614
        .extern func_02053690
        .extern func_02053698
        .global func_02052e90
        .arm
func_02052e90:
    stmdb sp!, {r4, r5, r6, lr}
    mov r4, r1
    mov r6, r0
    mov r0, r4
    bl func_02053614
    cmp r0, #0x1
    beq .L_74
    cmp r0, #0x2
    beq .L_30
    cmp r0, #0x3
    beq .L_68
    b .L_7c
.L_30:
    mov r0, r4
    bl func_02053698
    ldr r2, [r6, #0x24]
    mov r4, r0
    mov r5, r1
    bl func_02053460
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr r2, [r6, #0x24]
    mov r0, r4
    mov r1, r5
    bl func_02053440
    ldmia sp!, {r4, r5, r6, pc}
.L_68:
    mov r0, r4
    bl func_02053690
    ldmia sp!, {r4, r5, r6, pc}
.L_74:
    mvn r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_7c:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
