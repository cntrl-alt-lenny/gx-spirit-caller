; func_0203320c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02032748
        .extern func_02052c38
        .extern func_020530e4
        .extern func_02053114
        .extern func_02053158
        .global func_0203320c
        .arm
func_0203320c:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    add r4, r5, #0x1fc
    add r0, r4, #0xc40
    bl func_02053114
    cmp r0, #0x0
    beq .L_48
    add r0, r4, #0xc40
    bl func_020530e4
    cmp r0, #0x0
    add r0, r4, #0xc40
    beq .L_3c
    bl func_02052c38
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
.L_3c:
    bl func_02052c38
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_48:
    ldr r1, [r5]
    add r0, r4, #0xc40
    bl func_02053158
    add r0, r4, #0xc40
    bl func_02052c38
    mov r0, r5
    bl func_02032748
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
