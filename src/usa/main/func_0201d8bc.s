; func_0201d8bc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0208f908
        .extern func_0208f970
        .extern func_0208f9d8
        .extern func_0208fa40
        .extern func_0208faa8
        .extern func_0208fb10
        .extern func_0208fb78
        .extern func_0208fbe0
        .extern func_0209281c
        .extern func_020943b0
        .global func_0201d8bc
        .arm
func_0201d8bc:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov ip, #0x100000
    mov r5, r2
    rsb ip, ip, #0x0
    mov r7, r0
    mov r6, r1
    mov r4, r3
    tst r5, ip
    beq .L_1cc
    mov r1, r5
    mov r2, r4
    bl func_020943b0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_1cc:
    mov r1, r4
    bl func_0209281c
    cmp r6, #0x8
    addls pc, pc, r6, lsl #0x2
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
    b .L_204
    b .L_218
    b .L_22c
    b .L_240
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
    b .L_254
    b .L_268
    b .L_27c
    b .L_290
.L_204:
    mov r0, r7
    mov r1, r5
    mov r2, r4
    bl func_0208fbe0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_218:
    mov r0, r7
    mov r1, r5
    mov r2, r4
    bl func_0208fb10
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_22c:
    mov r0, r7
    mov r1, r5
    mov r2, r4
    bl func_0208fa40
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_240:
    mov r0, r7
    mov r1, r5
    mov r2, r4
    bl func_0208f970
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_254:
    mov r0, r7
    mov r1, r5
    mov r2, r4
    bl func_0208fb78
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_268:
    mov r0, r7
    mov r1, r5
    mov r2, r4
    bl func_0208faa8
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_27c:
    mov r0, r7
    mov r1, r5
    mov r2, r4
    bl func_0208f9d8
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_290:
    mov r0, r7
    mov r1, r5
    mov r2, r4
    bl func_0208f908
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
