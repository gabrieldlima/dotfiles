const entry = App.configDir + "/main.ts"
const main = "/tmp/ags/js"
const bundler = "esbuild" // or "bun"

try {
  switch (bundler) {
    case "esbuild": await Utils.execAsync([
      "esbuild", "--bundle", entry,
      "--format=esm",
      `--outfile=${main}`,
      "--external:resource://*",
      "--external:gi://*",
      "--external:file://*",
    ]); break

    case "bun": await Utils.execAsync([
      "bun", "build", entry,
      "--outfile", main,
      "--external", "resource://*",
      "--external", "gi://*",
      "--external", "file://*",
    ]); break

    default:
      throw `"${bundler}" is not a valid bundler!`
  }
  await import(`file://${main}`)
} catch (error) {
  console.error(error)
  App.quit
}

export {}
