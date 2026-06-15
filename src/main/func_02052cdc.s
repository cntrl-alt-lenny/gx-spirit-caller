; func_02052cdc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02053688
        .extern func_02053704
        .extern func_0205370c
        .extern func_02053720
        .extern func_02053728
        .global func_02052cdc
        .arm
func_02052cdc:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    mov r4, r1
    mov r7, r0
    bl func_02053688
    mov r5, r0
    mov r0, r4
    bl func_02053688
    cmp r5, r0
    addne sp, sp, #0x4
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, pc}
    cmp r5, #0x3
    bne .L_e4
    mov r0, r7
    bl func_02053704
    mov r5, r0
    mov r0, r4
    bl func_02053704
    cmp r5, r0
    moveq r0, #0x1
    add sp, sp, #0x4
    movne r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_e4:
    cmp r5, #0x1
    bne .L_140
    mov r0, r7
    bl func_02053728
    mov r5, r0
    mov r6, r1
    mov r0, r4
    bl func_02053728
    cmp r6, r1
    cmpeq r5, r0
    bne .L_134
    mov r0, r7
    bl func_02053720
    mov r5, r0
    mov r0, r4
    bl func_02053720
    cmp r5, r0
    addeq sp, sp, #0x4
    moveq r0, #0x1
    ldmeqia sp!, {r4, r5, r6, r7, pc}
.L_134:
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_140:
    cmp r5, #0x2
    bne .L_178
    mov r0, r7
    bl func_0205370c
    mov r5, r0
    mov r6, r1
    mov r0, r4
    bl func_0205370c
    cmp r6, r1
    cmpeq r5, r0
    moveq r0, #0x1
    add sp, sp, #0x4
    movne r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_178:
    mov r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, pc}
