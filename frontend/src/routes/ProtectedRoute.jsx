import { Navigate } from "react-router-dom";
import useCurrentUser from "../hooks/useCurrentUser";
import { getHomeRouteForRole } from "../utils/roleRoutes";

export default function ProtectedRoute({ children, allowedRoles }) {
  const { user, loading } = useCurrentUser();

  if (loading) {
    return <div>Loading...</div>;
  }

  if (!user) {
    return <Navigate to="/login" replace />;
  }

  if (allowedRoles && !allowedRoles.includes(user.role)) {
    return <Navigate to={getHomeRouteForRole(user.role)} replace />;
  }

  return children;
}
