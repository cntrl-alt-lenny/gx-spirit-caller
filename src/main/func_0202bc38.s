; func_0202bc38 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02105eb8
        .extern func_0202b0b4
        .global func_0202bc38
        .arm
func_0202bc38:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r2
    mov r5, r1
    bl func_0202b0b4
    cmp r4, #0x0
    mov ip, #0x1
    beq .L_30
    ldr r2, _LIT0
    ldrb r1, [r2, r0]
    orr r1, r1, ip, lsl r5
    strb r1, [r2, r0]
    ldmia sp!, {r3, r4, r5, pc}
.L_30:
    ldr r3, _LIT0
    mvn r1, ip, lsl r5
    ldrb r2, [r3, r0]
    and r1, r2, r1
    strb r1, [r3, r0]
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_02105eb8
