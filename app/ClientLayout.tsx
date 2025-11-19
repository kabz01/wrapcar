"use client"

import "./globals.css"
import { Inter } from 'next/font/google'
import Header from "./components/header"
import Footer from "./components/footer"
import { ThemeProvider } from "@/components/theme-provider"
import { AnimatePresence } from "framer-motion"
import { usePathname } from 'next/navigation'
import type React from "react"
import { useState, useEffect } from "react"

const inter = Inter({ subsets: ["latin"] })

export default function ClientLayout({
  children,
}: {
  children: React.ReactNode
}) {
  const pathname = usePathname()
  const [mounted, setMounted] = useState(false)

  useEffect(() => {
    setMounted(true)
  }, [])

  return (
    <html lang="en" suppressHydrationWarning className="dark">
      <body className={inter.className}>
        <ThemeProvider attribute="class" defaultTheme="dark" enableSystem={false} disableTransitionOnChange>
          <Header />
          <AnimatePresence mode="wait">
            <main key={pathname} className="min-h-screen dark:bg-gray-950">
              {children}
            </main>
          </AnimatePresence>
          <Footer />
        </ThemeProvider>
      </body>
    </html>
  )
}
