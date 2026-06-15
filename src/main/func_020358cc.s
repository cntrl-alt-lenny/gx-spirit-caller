; func_020358cc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02038168
        .global func_020358cc
        .arm
func_020358cc:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrsb r0, [r4, #0x73]
    cmp r0, #0x1
    ldmneia sp!, {r4, pc}
    ldrsh r0, [r4, #0x66]
    ldr r1, [r4, #0x60]
    ldrsh r2, [r4, #0x64]
    cmp r0, #0x0
    ldrsh r1, [r1]
    mvn r3, #0x0
    beq .L_458
    cmp r0, #0x1
    beq .L_464
    cmp r0, #0x2
    moveq r2, r2, asr #0x3
    moveq r3, #0x40
    b .L_46c
.L_458:
    mov r2, r2, asr #0x1
    mov r3, #0x20
    b .L_46c
.L_464:
    mov r2, r2, asr #0x2
    mov r3, #0x30
.L_46c:
    cmp r3, #0x0
    ldmltia sp!, {r4, pc}
    cmp r1, r2
    ldmgtia sp!, {r4, pc}
    mov r0, r4
    add r1, r3, #0x100
    bl func_02038168
    ldrsh r0, [r4, #0x66]
    add r0, r0, #0x1
    strh r0, [r4, #0x66]
    ldmia sp!, {r4, pc}
