; func_020804c8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020804c8
        .arm
func_020804c8:
    stmdb sp!, {r4, r5, r6, lr}
    mov r3, r0, lsr #0x3
    mov r6, r1, lsr #0x3
    mul ip, r3, r6
    and r2, r0, #0x4
    and lr, r0, #0x2
    and r0, r0, #0x1
    add r4, r0, lr, lsr #0x1
    mov r5, r2, lsr #0x2
    and r0, r1, #0x4
    add lr, ip, #0x0
    add ip, r5, r4, lsl #0x1
    mla ip, r6, ip, lr
    and lr, r1, #0x2
    and r1, r1, #0x1
    add lr, r1, lr, lsr #0x1
    mov r1, r0, lsr #0x2
    add r1, r1, lr, lsl #0x1
    mla ip, r3, r1, ip
    add r1, r4, r2, lsr #0x2
    add r0, lr, r0, lsr #0x2
    mla r0, r1, r0, ip
    ldmia sp!, {r4, r5, r6, pc}
