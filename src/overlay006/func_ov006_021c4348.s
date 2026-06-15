; func_ov006_021c4348 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov006_021cde48
        .global func_ov006_021c4348
        .arm
func_ov006_021c4348:
    stmdb sp!, {r3, lr}
    mov ip, #0x0
    str ip, [r3]
    str ip, [r3, #0x4]
    ldr lr, _LIT0
    str ip, [r3, #0x8]
.L_1e50:
    ldrsh r0, [lr]
    cmp r1, r0
    ldrgesh r0, [lr, #0x2]
    cmpge r2, r0
    blt .L_1e8c
    ldrsh r0, [lr, #0x4]
    cmp r1, r0
    ldrlesh r0, [lr, #0x6]
    cmple r2, r0
    bgt .L_1e8c
    mov r0, #0x1
    str r0, [r3]
    ldr r1, [lr, #0x8]
    str r1, [r3, #0x4]
    ldmia sp!, {r3, pc}
.L_1e8c:
    add ip, ip, #0x1
    cmp ip, #0x8
    add lr, lr, #0xc
    blt .L_1e50
    mov r0, #0x0
    str r0, [r3]
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov006_021cde48
