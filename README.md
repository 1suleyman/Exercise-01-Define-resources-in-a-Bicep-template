# 🧱 What Even *Is* Bicep?

> **Bitesize Lesson 🍬**  
Let’s kick things off with the big question — **what is Bicep**, and why should you care?  
This is your crash-course intro if you’re trying to understand what this repo is doing — and a cheeky reminder to future-me of the *why* behind all this declarative magic.

---

## 🚀 TL;DR: Bicep = Infrastructure as Code for Azure, Made Easy

**Bicep** is a language that lets you define and deploy your **Azure resources** using simple, readable code.  
You write what you *want* (not how to do it), and Azure Resource Manager (ARM) handles the rest.

Think of it like writing the blueprint to your dream house — and Azure goes out and builds it for you. 🏗️

---

## 🛠️ How Does It Work?

You write your Bicep file → submit it to Azure → Azure Resource Manager **deploys your resources**.  
Simple, right?

Behind the scenes, your Bicep file gets **converted into an ARM template** (aka JSON).  
This process is called **transpilation**, and you don’t usually have to worry about it — unless you’re curious and want to peek under the hood. 👀

So even though Bicep is new and shiny, it's still fully compatible with the old-school ARM system.

---

## 🤝 Bicep vs. ARM Templates (JSON)

If you’ve worked with **ARM templates**, you know the pain:

- Verbose JSON
- Hard-to-read syntax
- Lots of nesting 😵‍💫

**Bicep fixes that** with a much cleaner syntax and better developer experience:

| Feature           | ARM Templates (JSON) | Bicep |
|-------------------|----------------------|--------|
| Syntax            | Verbose, noisy       | Clean & readable |
| Authoring tools   | Limited              | Full IntelliSense support in VS Code |
| Learning curve    | Steep                | Beginner-friendly |

---

## 🧰 What Do I Need to Use Bicep?

To get started, you’ll need:

1. **Azure CLI or PowerShell** (latest version – they support Bicep natively)
2. **VS Code** (highly recommended)
3. The **Bicep extension** for VS Code (gives you autocomplete, validation, and helpful tooltips)

These tools make writing Bicep feel more like coding and less like arguing with a config file. 🧠💻

---

## 📄 Defining Resources with Bicep

Let’s say your toy company 🧸 is launching a new product and you want to spin up a **storage account** and an **App Service**.

Here’s how you’d define a storage account in Bicep:

```bicep
resource storageAccount 'Microsoft.Storage/storageAccounts@2023-05-01' = {
  name: 'toylaunchstorage'
  location: 'westus3'
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties: {
    accessTier: 'Hot'
  }
}
```

That’s it. Way easier than JSON, right?

---

## 🔗 Resource Dependencies – It Just Works™

Sometimes resources depend on each other. Like, you can’t deploy an **App Service app** unless you’ve created the **App Service plan** it runs on.

Here’s the App Service plan:

```bicep
resource appServicePlan 'Microsoft.Web/serverFarms@2023-12-01' = {
  name: 'toy-product-launch-plan'
  location: 'westus3'
  sku: {
    name: 'F1'
  }
}
```

Then here’s the app that uses it:

```bicep
resource appServiceApp 'Microsoft.Web/sites@2023-12-01' = {
  name: 'toy-product-launch-1'
  location: 'westus3'
  properties: {
    serverFarmId: appServicePlan.id
    httpsOnly: true
  }
}
```

By referencing `appServicePlan.id`, Bicep automatically knows that the app depends on the plan. Azure handles the order for you — no need to manually declare dependencies.

---

## 🧠 Symbolic Names vs. Real Names

Bicep uses **symbolic names** inside your code (`appServicePlan`, `storageAccount`, etc.)  
But those don’t show up in Azure.

What *does* show up in Azure? The values you define for `name:`, like `'toylaunchstorage'`.

So:  
- **Symbolic name** = used in your code.  
- **Resource name** = what shows up in Azure.

---

## 🎯 TL;DR Recap

- **Bicep = a better way to write ARM templates**
- Declarative, clean, and powerful
- Works with Azure CLI, PowerShell, and VS Code
- Makes dependencies and resource deployment way easier
- Behind the scenes, it still becomes a JSON ARM template — so it’s fully Azure-native

---

This is the foundation for everything else you’ll see in this repo.  
So now you know: **Bicep is how we tell Azure what we want — simply, cleanly, and in a way future-me will understand.** 😎
