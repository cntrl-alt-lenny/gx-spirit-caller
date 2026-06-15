; func_02049120 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219dc80
        .extern func_0204918c
        .global func_02049120
        .arm
func_02049120:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r4, _LIT0
    mov r6, r0
    ldr r0, [r4]
    cmp r0, #0x0
    beq .L_194
    cmp r6, #0x0
    bne .L_19c
.L_194:
    mvn r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_19c:
    ldr r0, [r0, #0x14]
    mov r5, #0x0
    cmp r0, #0x0
    ble .L_1d4
.L_1ac:
    mov r0, r5
    bl func_0204918c
    cmp r6, r0
    moveq r0, r5
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr r0, [r4]
    add r5, r5, #0x1
    ldr r0, [r0, #0x14]
    cmp r5, r0
    blt .L_1ac
.L_1d4:
    mvn r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_0219dc80
