; func_020a7268 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020a71e4
        .extern func_020aaddc
        .global func_020a7268
        .arm
func_020a7268:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r7, r1
    mov r8, r0
    mov r0, r7
    mov r6, r2
    bl func_020aaddc
    mov r5, r0
    cmp r8, #0x0
    mov r4, #0x0
    beq .L_80
    cmp r6, #0x0
    bls .L_80
.L_30:
    ldrsb r0, [r7]
    cmp r0, #0x0
    beq .L_68
    mov r0, r8
    mov r1, r7
    mov r2, r5
    bl func_020a71e4
    cmp r0, #0x0
    add r8, r8, #0x2
    addgt r7, r7, r0
    subgt r5, r5, r0
    bgt .L_74
    mvn r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_68:
    mov r0, #0x0
    strh r0, [r8]
    b .L_80
.L_74:
    add r4, r4, #0x1
    cmp r4, r6
    bcc .L_30
.L_80:
    mov r0, r4
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
