        .text
        .extern data_02102958
        .global func_020a71e4
        .arm
func_020a71e4:
    stmdb sp!, {r3, lr}
    ldr r3, .L_020a71fc
    ldr r3, [r3, #0x8]
    ldr r3, [r3, #0x0]
    blx r3
    ldmia sp!, {r3, pc}
.L_020a71fc: .word data_02102958
