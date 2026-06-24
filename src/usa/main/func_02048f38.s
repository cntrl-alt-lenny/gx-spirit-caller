; func_02048f38 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219dba0
        .extern func_02049850
        .global func_02048f38
        .arm
func_02048f38:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x210
    ldr r1, _LIT0
    mov r4, r0
    ldr r3, [r1]
    ldr r2, [r3, #0x44]
    cmp r2, #0x0
    beq .L_34
    ldr r1, [r3]
    cmp r1, #0x1
    beq .L_34
    ldr r1, [r3, #0x48]
    blx r2
.L_34:
    ldr r0, _LIT0
    ldr r1, [r0]
    ldr r0, [r1, #0x34]
    cmp r0, #0x0
    addeq sp, sp, #0x210
    ldmeqia sp!, {r4, pc}
    ldr r1, [r1, #0x18]
    mov r0, #0xc
    mla r0, r4, r0, r1
    add r1, sp, #0x108
    bl func_02049850
    ldr r2, _LIT0
    mov r1, r0
    ldr r0, [r2]
    add r2, sp, #0x108
    ldr r3, [r0, #0x38]
    ldr ip, [r0, #0x34]
    mov r0, r4
    blx ip
    add sp, sp, #0x210
    ldmia sp!, {r4, pc}
_LIT0: .word data_0219dba0
