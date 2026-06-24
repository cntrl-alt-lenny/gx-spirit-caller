; func_0200c268 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02103fcc
        .global func_0200c268
        .arm
func_0200c268:
    stmdb sp!, {r3, lr}
    ldr lr, [r0, #0x1c]
    mov ip, #0xc
    mla ip, r1, ip, lr
    ldr ip, [ip, #0x8]
    cmp ip, r2
    moveq r0, #0x1
    ldmeqia sp!, {r3, pc}
    cmp r3, #0x1
    bne .L_38
    cmp ip, r2
    bcs .L_4c
    mov r0, #0x1
    ldmia sp!, {r3, pc}
.L_38:
    cmp r3, #0x2
    bne .L_4c
    cmp ip, r2
    movhi r0, #0x1
    ldmhiia sp!, {r3, pc}
.L_4c:
    str r2, [r0, #0x264]
    str r1, [r0, #0x268]
    ldr r2, [r0, #0x7c]
    ldr r1, _LIT0
    orr r2, r2, #0x8000000
    str r2, [r0, #0x7c]
    mov r0, #0x1
    str r0, [r1, #0x20]
    ldmia sp!, {r3, pc}
_LIT0: .word data_02103fcc
