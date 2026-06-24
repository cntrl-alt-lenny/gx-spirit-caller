; func_020331b8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020326f4
        .extern func_02052bc4
        .extern func_02053070
        .extern func_020530a0
        .extern func_020530e4
        .global func_020331b8
        .arm
func_020331b8:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    add r4, r5, #0x1f4
    add r0, r4, #0xc40
    bl func_020530a0
    cmp r0, #0x0
    beq .L_48
    add r0, r4, #0xc40
    bl func_02053070
    cmp r0, #0x0
    add r0, r4, #0xc40
    beq .L_3c
    bl func_02052bc4
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
.L_3c:
    bl func_02052bc4
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_48:
    ldr r1, [r5]
    add r0, r4, #0xc40
    bl func_020530e4
    add r0, r4, #0xc40
    bl func_02052bc4
    mov r0, r5
    bl func_020326f4
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
