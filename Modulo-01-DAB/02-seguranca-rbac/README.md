[English](README.md) | [Português (Brasil)](README.pt-br.md)

# Lab 02: Security, RBAC, and Simulator

One of Data API Builder's core strengths is its built-in authorization model. DAB does not expose any entity by default; access must be explicitly granted through permissions.

## Authentication vs. Authorization in DAB

In production, DAB is typically configured with authentication providers such as *Static Web Apps* or *Microsoft Entra ID (formerly Azure AD)*. For local development and testing, DAB provides an integrated provider called **Simulator**.

This is defined in `dab-config.json`:

```json
"host": {
    "mode": "development",
    "authentication": {
        "provider": "Simulator"
    }
}
```

The Simulator avoids the complexity of generating JWT tokens locally. Instead, you specify the desired role by passing an HTTP header:
`X-MS-API-ROLE: <role-name>`

## Role-Based Access Control (RBAC)

Within entity definitions, the `permissions` array configures allowed `actions`:

```json
"permissions": [
    {
        "role": "anonymous",
        "actions": ["read"]
    },
    {
        "role": "authenticated",
        "actions": ["read", "create"]
    },
    {
        "role": "admin",
        "actions": ["*"]
    }
]
```

- `anonymous`: Applied when no identity or authentication header is provided.
- `authenticated`: Assumed by all authenticated users.
- `admin` (or custom role names): Specific permissions assigned to elevated roles.
- Allowed actions (`actions`): Can be `create`, `read`, `update`, `delete`, `execute`, or `*` (all of the above).

## Hands-on Testing

1. Return to the root directory and launch the interactive menu (`start-lab.bat` on Windows or `./start-lab.sh` on Linux/Mac).
2. Select option **2** (Lab 02 - Security).
3. Once the environment starts, open the `requests.http` file located in this folder.
4. Send the request with header `X-MS-API-ROLE: anonymous` attempting a `POST` method. Notice the `403 Forbidden` response due to lack of authorization.
5. Next, send the request with `X-MS-API-ROLE: admin` (or authenticated) and verify that the creation operation (`POST`) succeeds with `201 Created`.
