import graphene
from graphene_django.types import DjangoObjectType
from habsci.services.models import Service as ServiceModel

class ServiceType(DjangoObjectType):
    class Meta:
        model = ServiceModel


class Query(graphene.ObjectType):
    all_services = graphene.List(ServiceType)

    def resolve_all_services(self, test):
        return ServiceModel.objects.all()
    # This class will inherit from multiple Queries
    # as we begin to add more apps to our project
    pass

schema = graphene.Schema(query=Query)